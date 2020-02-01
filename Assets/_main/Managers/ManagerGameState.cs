using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Mangos
{
    public class ManagerGameState : MonoBehaviour
    {
        public GameState currentState;

        private void Awake()
        {
            ManagerStatic.gameStateManager = this;
        }

        private void Start()
        {
            
        }

        void Update()
        {
            
        }

        public void OnWin()
        {
            
        }

        public void OnLose()
        {
            
        }

        public void SetPause()
        {
            currentState = GameState.PAUSE;
            Time.timeScale = 0.0f;
        }

        public void SetPlay()
        {
            currentState = GameState.GAMEPLAY;
            Time.timeScale = 1.0f;
        }

        public void SetWin()
        {
            currentState = GameState.GAME_END;
            Time.timeScale = 1.0f;
        }

        public void SetCredits()
        {
            currentState = GameState.CREDITS;
            Time.timeScale = 1.0f;
        }
    }
}