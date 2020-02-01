using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Mangos
{

    //ES EL MANAGER STATICO ES UN SCRIPT QUE SE COMUNICA CON TODOS LOS DEMAS SCRIPTS SIN IMPORTA SI ESTA EN LA ESCENA

    //ESTE ES UN ENUMERADOR QUE NOS DICE LOS ESTADOS DE LA APLICACION
    public enum AppState
    {
        
    }

    public enum GameState
    {
        PAUSE,
        GAMEPLAY,
        CREDITS,
        GAME_END,
        MAIN_MENU
    }

    //ESTE SE ENCARGARA DE MANTENER A LOS DEMAS MANAGER COMUNICADOS ENTRE ELLOS
    public static class ManagerStatic
	{
        public static float GeneralVolumen = 95.0f;
		public static ManagerInput inputManager;
		public static ManagerApp appManager;
		public static ManagerScene sceneManager;
        public static ManagerAudio audioManager;
        public static ManagerGameState gameStateManager;
        public static ManagerUI uiManager;
	}
}
