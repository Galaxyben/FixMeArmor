using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class temp : MonoBehaviour
{
    public Transform[] fix;
    public float offset;
    public void doit(){
        for(int i = 0; i < fix.Length; i++)
        {
            fix[i].position += fix[i].localPosition.normalized * offset;
        }
    }
}
