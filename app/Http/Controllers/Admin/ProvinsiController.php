<?php

namespace App\Http\Controllers\Admin;

use App\Models\Negara;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Provinsi;
use Illuminate\Support\Facades\Auth;
use Modules\Language\Entities\Language;

class ProvinsiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_if(!userCan('provinsi.view'), 403);

        // $kabupatenCategories = Kabupaten::all();
        $provinsiCategories = Provinsi::with('negara')->get();
        // dd($kabupatenCategories);
        $negaraCategories = Negara::all();
        $app_language = Language::latest()->get(['code']);

        // Fetch options for select2
        $select2Options = Negara::pluck('name', 'id');

        return view('admin.Provinsi.index', compact('provinsiCategories', 'negaraCategories', 'app_language', 'select2Options'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request);
        abort_if(!userCan('provinsi.create'), 403);

        // dd($request);

        // Validate the request data
        $request->validate([
            'name' => 'required', // Add any validation rules you need
        ]);

        // Create a new Negara instance and set the 'name' attribute
        $provinsi = new Provinsi();
        $provinsi->name = $request->input('name'); // Assuming the input field name is 'name'
        $provinsi->id_negara = $request->input('negara'); // Assuming the input field name is 'name'

        // Save the data
        $provinsi->save();

        // validation
        // $validate_array = [];
        // $validate_array['name'] = 'required';
        // $this->validate($request, $validate_array);

        flashSuccess(__('Provinsi telah diinput'));
        return back();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Provinsi $provinsiCategory)
    {
        // dd($provinsiCategory);
        abort_if(!userCan('provinsi.update'), 403);
        $provinsiEdit = $provinsiCategory;

        $provinsiCategories = Provinsi::all();
        $negaraCategories = Negara::all();
        $app_language = Language::latest()->get(['code']);

        // Fetch options for select2
        $select2OptionsEdit = Negara::pluck('name', 'id');

        return view('admin.Provinsi.index', compact('provinsiEdit', 'provinsiCategories', 'negaraCategories', 'app_language', 'select2OptionsEdit'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Profinsi $provinsiCategory)
    {
        dd(($provinsiCategory));
        abort_if(!userCan('negara.update'), 403);


        // $negara = new Negara();
        // Assuming the input field name is 'name'
        $provinsiCategory->id_negara = $request->input('id_negara');
        $provinsiCategory->name = $request->input('name');

        // Save the changes to the existing Negara record
        $provinsiCategory->save();
        // dd(($negara->name));

        flashSuccess(__('category_updated_successfully'));
        // return back();
        return redirect()->route('provinsiCategory.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Profinsi $provinsiCategory)
    {
        abort_if(!userCan('provinsi.delete'), 403);

        $provinsiCategory->delete();

        flashSuccess(__('category_deleted_successfully'));
        return back();
    }
}
