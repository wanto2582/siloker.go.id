<?php

namespace App\Http\Controllers\Payment;

use Razorpay\Api\Api;
use Illuminate\Http\Request;
use Modules\Plan\Entities\Plan;
use App\Http\Traits\PaymentTrait;
use App\Http\Controllers\Controller;
use App\Notifications\MembershipUpgradeNotification;

class RazorpayController extends Controller
{
    use PaymentTrait;

    public function payment(Request $request)
    {
        $job_payment_type = session('job_payment_type') ?? 'package_job';
        if ($job_payment_type == 'per_job') {
            $price = session('job_total_amount') ?? '100';
        }else{
            $plan = session('plan');
            $price = $plan->price;
        }

        $amount = currencyConversion($price, null, 'INR', 1);
        $converted_amount = currencyConversion($price);

        session(['order_payment' => [
            'payment_provider' => 'razorpay',
            'amount' =>  $amount,
            'currency_symbol' => '₹',
            'usd_amount' =>  $converted_amount,
        ]]);

        $input = $request->all();
        $api = new Api(config('zakirsoft.razorpay_key'), config('zakirsoft.razorpay_secret'));

        $payment = $api->payment->fetch($input['razorpay_payment_id']);

        if (count($input)  && !empty($input['razorpay_payment_id'])) {
            try {
                $payment->capture(array('amount' => $payment['amount']));

                session(['transaction_id' => $input['razorpay_payment_id'] ?? null]);
                $this->orderPlacing();
            } catch (\Exception $e) {
                return $e->getMessage();
                session()->put('error', $e->getMessage());
                return redirect()->back();
            }
        }
    }
}
