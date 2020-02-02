using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MasterManager : MonoBehaviour
{
    CameraManager cm;

    public GameObject hammeringGame;
    public GameObject solderingGame;
    public GameObject bakingGame;

    void Start()
    {
        cm = GetComponent<CameraManager>();
    }
    
    void Update()
    {
        
    }

    public void StartPlaying()
    {
        SetSoldering();
    }

    void SetBake()
    {
        cm.SetDoF(1.5f);
        cm.SetToBake();
        hammeringGame.SetActive(false);
        solderingGame.SetActive(false);
        bakingGame.SetActive(true);
    }

    void SetHammering()
    {
        cm.SetDoF(7f);
        cm.SetToHamering();
        hammeringGame.SetActive(true);
        solderingGame.SetActive(false);
        bakingGame.SetActive(false);
    }

    void SetSoldering()
    {
        cm.SetDoF(0.31f);
        cm.SetToSoldering();
        hammeringGame.SetActive(false);
        solderingGame.SetActive(true);
        bakingGame.SetActive(false);
    }
}
