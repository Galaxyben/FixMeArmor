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
        SetBake();
    }

    void SetBake()
    {
        cm.SetDoF(1.5f);
        cm.SetToBake();
    }
}
