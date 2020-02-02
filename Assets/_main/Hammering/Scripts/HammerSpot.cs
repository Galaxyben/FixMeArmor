using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HammerSpot : MonoBehaviour
{
    private void OnTriggerEnter(Collider _col)
    {
        if (_col.gameObject.CompareTag("Hammer"))
        {
            transform.parent.GetComponent<HammerSpotSpawner>().AddScore();
        }
    }

    void Start()
    {
        
    }

    void Update()
    {
        
    }
}
