<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Articulo extends Model
{
    public function Categoria()
    {
        return $this->belongsTo(Categoria::class);
    }
    public function Medida()
    {
        return $this->belongsTo(Medida::class);
    }
    public function Marca()
    {
        return $this->belongsTo(Marca::class);
    }
    public function Inventarios()
    {
        return $this->hasMany(Inventario::class);
    }
}
