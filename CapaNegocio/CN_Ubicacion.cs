using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;
using CapaDatos;
using System.Security.Cryptography.X509Certificates;
namespace CapaNegocio
{
    public class CN_Ubicacion
    {
        private CD_Ubicacion objCapaDaro = new CD_Ubicacion();

        public List<Departamento> ObteberDepartamento()
        {
           return objCapaDaro.ObteberDepartamento();
        }
        public List<Provincia> ObteberProvincia(string iddepartamento)
        {
            return objCapaDaro.ObteberProvincia(iddepartamento);
        }

        public List<Distrito> ObteberDistrito(string iddepartamento, string idprovincia)
        {
            return objCapaDaro.ObteberDistrito(iddepartamento, idprovincia);
        }
    }
}
