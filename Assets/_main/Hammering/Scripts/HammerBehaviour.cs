using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HammerBehaviour : MonoBehaviour
{
    [Header("Hammer")]
    public string useHammerInput;
    public string useHammerAnimTrigger;

    private Animator anim;
    private GameObject target;

    // Inputs
    private bool useHammer;

    private void Start()
    {
        anim = GetComponent<Animator>();
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
