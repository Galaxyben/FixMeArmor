using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

public class CameraManager : MonoBehaviour
{
    public PostProcessVolume postProcess;
    float depthOfFieldInitial = 1.1f;
    float depthOfFieldStandard = 15f;
    Vector3 camInitialPos = new Vector3(7.388f, 1.98f, -6.64f);
    [System.NonSerialized]public DepthOfField DoF;

    public Transform hammeringCamPos;
    public Transform solderingCamPos;
    public Transform bakingCamPos;
    
    void Start()
    {
        postProcess.profile.TryGetSettings(out DoF);
        DoF.focusDistance.value = depthOfFieldInitial;
        Camera.main.transform.position = camInitialPos;
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

    public void SetDoF(float val)
    {
        DoF.focusDistance.value = val;
    }
}
