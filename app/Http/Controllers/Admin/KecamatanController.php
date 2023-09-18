<?php

namespace App\Http\Controllers\Admin;

use App\Models\Negara;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Kabupaten;
use App\Models\Kecamatan;
use Illuminate\Support\Facades\Auth;
use Modules\Language\Entities\Language;

class KecamatanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_if(!userCan('kecamatan.view'), 403);

        // $kabupatenCategories = Kabupaten::all();
        $kecamatanCategories = Kecamatan::with('negara', 'kabupaten')->get();
        // dd($kecamatanCategories);
        $negaraCategories = Negara::all();
        $app_language = Language::latest()->get(['code']);

        // Fetch options for select2
        $select2Options = Negara::pluck('name', 'id');
        $select2Options2 = Kabupaten::pluck('name', 'id');

        return view('admin.Kecamatan.index', compact('kecamatanCategories', 'negaraCategories', 'app_language', 'select2Options', 'select2Options2'));
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
        abort_if(!userCan('kabupaten.create'), 403);

        // dd($request);

        // Validate the request data
        $request->validate([
            'name' => 'required', // Add any validation rules you need
        ]);

        // Create a new Negara instance and set the 'name' attribute
        $kabupaten = new Kecamatan();
        $kabupaten->name = $request->input('name'); // Assuming the input field name is 'name'
        $kabupaten->id_negara = $request->input('negara'); // Assuming the input field name is 'name'
        $kabupaten->id_kabupaten = $request->input('kabupaten'); // Assuming the input field name is 'name'

        // Save the data
        $kabupaten->save();

        // validation
        // $validate_array = [];
        // $validate_array['name'] = 'required';
        // $this->validate($request, $validate_array);

        flashSuccess(__('Kabupaten telah diinput'));
        return back();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Kabupaten $kabupatenCategory)
    {
        // dd($kabupatenCategory);
        abort_if(!userCan('kabupaten.update'), 403);
        $kabupatenEdit = $kabupatenCategory;

        $kabupatenCategories = Kabupaten::all();
        $negaraCategories = Negara::all();
        $app_language = Language::latest()->get(['code']);

        // Fetch options for select2
        $select2OptionsEdit = Negara::pluck('name', 'id');

        return view('admin.kabupaten.index', compact('kabupatenEdit', 'kabupatenCategories', 'negaraCategories', 'app_language', 'select2OptionsEdit'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Kabupaten $kabupatenCategory)
    {
        dd(($kabupatenCategory));
        abort_if(!userCan('negara.update'), 403);


        // $negara = new Negara();
        // Assuming the input field name is 'name'
        $kabupatenCategory->id_negara = $request->input('id_negara');
        $kabupatenCategory->name = $request->input('name');

        // Save the changes to the existing Negara record
        $kabupatenCategory->save();
        // dd(($negara->name));

        flashSuccess(__('category_updated_successfully'));
        // return back();
        return redirect()->route('kabupatenCategory.index');
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
