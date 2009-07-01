using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.TipoCargo
{
    public class TipoCargoRepositorio : Data.Repositorios.TipoCargo.ITipoCargoRepositorio 
    {
        sigsetEntities _data;
        
        public TipoCargoRepositorio()
        {  
            _data = new sigsetEntities();
        }
        public IQueryable <Tipo_Cargo> GetTipoCargo()
        {
            var tipo_cargo = from tc in _data.Tipo_Cargo
                             select tc;
            return tipo_cargo;
        }

        public Tipo_Cargo GetTipoCargoById(int id)
        {
            var tipo_cargo = (from tc in _data.Tipo_Cargo
                              where tc.Id_Tipo_Cargo == id
                              select tc).FirstOrDefault();
            return tipo_cargo;
        }
             


    }
}
