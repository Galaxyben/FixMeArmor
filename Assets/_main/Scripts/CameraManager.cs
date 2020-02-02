using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

public class CameraManager : MonoBehaviour
{
    public PostProcessVolume postProcess;
    float depthOfFieldInitial = 1.1f;
    float depthOfFieldStandard = 15f;
    DepthOfField DoF;

    public Transform hammeringCamPos;
    public Transform solderingCamPos;
    public Transform bakingCamPos;
    
    void Start()
    {
        postProcess.profile.TryGetSettings(out DoF);
    }
    
    void Update()
    {
        
    }

    public void SetToHamering()
    {
        Camera.main.transform.position = hammeringCamPos.position;
        Camera.main.transform.rotation = hammeringCamPos.rotation;
    }

    public void SetToSoldering()
    {
        Camera.main.transform.position = solderingCamPos.position;
        Camera.main.transform.rotation = solderingCamPos.rotation;
    }

    public void SetToBake()
    {
        Camera.main.transform.position = bakingCamPos.position;
        Camera.main.transform.rotation = bakingCamPos.rotation;
    }

    public void DoF_Standard()
    {
        DoF.focusDistance.value = depthOfFieldStandard;
    }

    public void DoF_Blur()
    {
        DoF.focusDistance.value = depthOfFieldInitial;
    }
}
