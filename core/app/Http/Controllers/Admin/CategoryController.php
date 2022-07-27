<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $pageTitle = "Manage Category";
        $emptyMessage = "No data found";
        $categorys = Category::select('id', 'name', 'status')->latest()->paginate(getPaginate());
        return view('admin.category.index', compact('pageTitle', 'emptyMessage', 'categorys'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:120|unique:categories'
        ]);
        $category = new Category();
        $category->name = $request->name;
        $category->status = $request->status ? 1 : 2;
        $category->save();
        $notify[] = ['success', 'Category has been created'];
        return back()->withNotify($notify);
    }

    public function update(Request $request)
    {
        $request->validate([
            'id' => 'required|exists:categories,id',
            'name' => 'required|max:120|unique:categories,name,'.$request->id,
        ]);
        $category = Category::findOrFail($request->id);
        $category->name = $request->name;
        $category->status = $request->status ? 1 : 2;
        $category->save();
        $notify[] = ['success', 'Category has been updated'];
        return back()->withNotify($notify);
    }
}
