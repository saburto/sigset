using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.TipoCargo;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;

namespace Services.TipoCargo
{
   public class TipoCargoServicio  
    {
       private ITipoCargoRepositorio _repo;
       public TipoCargoServicio(ITipoCargoRepositorio repo)
       {
           _repo = repo;
       }
       public TipoCargoServicio() 
           :this (new TipoCargoRepositorio())
       {
       }

       public IList<Tipo_Cargo> GetTodosLosTiposCargo()
       {
           return _repo.GetTipoCargo().ToList();
       }
        
    }
}
