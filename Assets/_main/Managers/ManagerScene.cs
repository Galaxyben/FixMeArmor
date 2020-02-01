using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Mangos
{
	public class ManagerScene : MonoBehaviour {


        //ESTE SOLO NOS DIRA EL NUMERO EN DE LA ESCENA ACTUAL ES PARA METODOS DE DEBUGUEO
		public int currentScene;

		void Awake()
		{
            //SE OCUOPA DECIRLEA AL MANAGER STATIC QUIEN ES SI MANAGER DE ESCENAS
            ManagerStatic.sceneManager = this;
		}

        public void LoadScene(int _id)
        {
            SceneManager.LoadScene(_id);
        }

		//ES UN METODO PARA CARGAR UNA ESCENA DIRECTAMENTE
		public void ProScene(Scene _scene)
		{
			SceneManager.LoadScene(_scene.name);
		}

        //ES UN METODO PARA CARGAR LA ESCENA POR ID Y SE LE PASA UN BOOLEANO PARA HACER LA CARGA ADITIVA
		public void LoadScene(int _id, bool _isAditive)
		{
			if (_isAditive)
				SceneManager.LoadScene (_id, LoadSceneMode.Additive);
			if (!_isAditive)
				SceneManager.LoadScene (_id);
		}

        //ES UN METODO PARA CARGAR LA ESCENA POR SU NOMBRE
		public void LoadScene(string _name, bool _isAdditive)
		{
            if (_isAdditive)
			    SceneManager.LoadScene(_name, LoadSceneMode.Additive);
            if (!_isAdditive)
                SceneManager.LoadScene(_name);
		}

        //ES UN METODO QUE TERMINA LA APLICACION
		public void ExitApplication()
		{
			Application.Quit ();
		}
	}
}
