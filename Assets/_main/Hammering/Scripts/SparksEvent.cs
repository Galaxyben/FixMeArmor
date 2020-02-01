using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SparksEvent : MonoBehaviour
{
    public ParticleSystem sparks;

    public void PlaySparks()
    {
        sparks.Play();
    }
}
