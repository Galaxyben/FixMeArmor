using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HammerBehaviour : MonoBehaviour
{
    [Header("Hammer")]
    public string useHammerInput;
    public string useHammerAnimTrigger;
    public Animator anim;

    private GameObject target;

    // Inputs
    private bool useHammer;

    private void Update()
    {
        GetInputs();
        ProcessInputs();
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
        anim.SetTrigger(useHammerAnimTrigger);
    }
}
