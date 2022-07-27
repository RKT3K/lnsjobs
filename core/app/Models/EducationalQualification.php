<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EducationalQualification extends Model
{
    use HasFactory;

    public function levelOfEducation()
    {
        return $this->belongsTo(levelOfEducation::class, 'level_of_education_id');
    }

    public function degree()
    {
        return $this->belongsTo(Degree::class, 'degree_id');
    }
}
