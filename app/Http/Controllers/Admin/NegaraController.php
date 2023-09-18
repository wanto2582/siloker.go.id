<?php

namespace App\Http\Controllers\Admin;

use App\Models\Negara;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Modules\Language\Entities\Language;

class NegaraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_if(!userCan('negara.view'), 403);

        $countryCategories = Negara::all();
        $app_language = Language::latest()->get(['code']);

        return view('admin.Negara.index', compact('countryCategories', 'app_language'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        abort_if(!userCan('negara.create'), 403);

        // dd($request);

        // Validate the request data
        $request->validate([
            'name' => 'required', // Add any validation rules you need
        ]);

        // Create a new Negara instance and set the 'name' attribute
        $negara = new Negara();
        $negara->name = $request->input('name'); // Assuming the input field name is 'name'

        // Save the data
        $negara->save();

        // validation
        // $validate_array = [];
        // $validate_array['name'] = 'required';
        // $this->validate($request, $validate_array);

        flashSuccess(__('Negara Sudah Diinput'));
        return back();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Negara $countryCategory)
    {
        abort_if(!userCan('negara.update'), 403);
        // dd($countryCategory);
        $negaraEdit = $countryCategory;

        $countryCategories = Negara::all();
        // $countries = Negara::find($negara->id);
        // dd($negaraEdit);
        $app_language = Language::latest()->get(['code']);

        return view('admin.negara.index', compact('negaraEdit', 'countryCategories', 'app_language'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Negara $countryCategory)
    {
        // dd(($countryCategory));
        abort_if(!userCan('negara.update'), 403);


        // $negara = new Negara();
        // Assuming the input field name is 'name'
        $countryCategory->name = $request->input('name');

        // Save the changes to the existing Negara record
        $countryCategory->save();
        // dd(($negara->name));

        flashSuccess(__('category_updated_successfully'));
        // return back();
        return redirect()->route('countryCategory.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Negara $countryCategory)
    {
        abort_if(!userCan('negara.delete'), 403);

        $countryCategory->delete();

        flashSuccess(__('category_deleted_successfully'));
        return back();
    }
}
