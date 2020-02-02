using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HammerBehaviour : MonoBehaviour
{
    [Header("Hammer")]
    public string useHammerInput;
    public string useHammerAnimTrigger;
    public Animator anim;
    public GameObject target;
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

    private void Update()
    {
        GetInputs();
        ProcessInputs();
    }

    public void SetTarget(GameObject _target)
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
        if (useHammer) { Use(); }
    }

    public void Use()
    {
        if (hittingSpot)
        {
            sparks.GetComponent<Animator>().SetTrigger("PlaySparks");
            target.GetComponent<HammerSpotSpawner>().AddScore();
        }
        else
            smoke.GetComponent<Animator>().SetTrigger("PlaySparks");
        anim.SetTrigger(useHammerAnimTrigger);
        target.GetComponent<HammerSpotSpawner>().SpawnNextSpot();
    }
}
