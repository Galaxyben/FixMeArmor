﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MasterManager : MonoBehaviour
{
    CameraManager cm;

    public GameObject hammeringGame;
    public GameObject solderingGame;
    public GameObject bakingGame;

    public List<float> scores = new List<float>();

    void Start()
    {
        cm = GetComponent<CameraManager>();
        cm.SetDoF(0.1f);
    }
    
    void Update()
    {
        
    }

    public void StartPlaying()
    {
        SetBake();
        scores.Clear();
    }

    public void SetBake()
    {
        cm.SetDoF(1.5f);
        cm.SetToBake();
        hammeringGame?.SetActive(false);
        solderingGame?.SetActive(false);
        bakingGame?.SetActive(true);
    }

    public void SetHammering()
    {
        cm.SetDoF(7f);
        cm.SetToHamering();
        hammeringGame?.SetActive(true);
        solderingGame?.SetActive(false);
        bakingGame?.SetActive(false);
    }

    public void SetSoldering()
    {
        cm.SetDoF(0.31f);
        cm.SetToSoldering();
        hammeringGame?.SetActive(false);
        solderingGame?.SetActive(true);
        bakingGame?.SetActive(false);
    }
}
