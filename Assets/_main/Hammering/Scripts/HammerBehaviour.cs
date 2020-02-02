using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HammerBehaviour : WorkStation
{
    [Header("Hammer")]
    public string useHammerInput;
    public string useHammerAnimTrigger;
    public Animator anim;
    public HammerSpotSpawner target;
    public GameObject sparks;
    public GameObject smoke;

    public bool hittingSpot = false;

    // Inputs
    private bool useHammer;

    private void OnTriggerEnter(Collider _col)
    {
        if (_col.gameObject.CompareTag("HammerSpot"))
        {
            hittingSpot = true;
        }
    }

    private void OnTriggerExit(Collider _col)
    {
        if (_col.gameObject.CompareTag("HammerSpot"))
        {
            hittingSpot = false;
        }
    }

    public void SetTarget(HammerSpotSpawner _target)
    {
        target = _target;
    }

    public void GetInputs()
    {
        if (Input.GetButtonDown(useHammerInput))
        {
            useHammer = true;
        } else
        {
            useHammer = false;
        }
    }

    public void ProcessInputs()
    {
        if (useHammer) { Hammer(); }
    }

    public override void Use()
    {
        GetInputs();
        ProcessInputs();
    }

    public void Hammer()
    {
        if (hittingSpot)
        {
            sparks.GetComponent<Animator>().SetTrigger("PlaySparks");
            target.AddScore();
        }
        else
            smoke.GetComponent<Animator>().SetTrigger("PlaySparks");
        anim.SetTrigger(useHammerAnimTrigger);
        target.SpawnNextSpot();

        if (target.isFinished())
        {
            onWorkFinish?.Invoke();
        }
    }

    public override float GetScore()
    {
        return target.GetScore();
    }
}
