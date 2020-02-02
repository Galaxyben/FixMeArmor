using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HammerSpotSpawner : MonoBehaviour
{
    public GameObject spot;
    public float spotNo;

    private int spawnedSpots = 0;
    private float score = 0;
    private Bounds bounds;
    private bool finished = false;

    private GameObject spt;

    private void Start()
    {
        bounds = GetComponent<Collider>().bounds;
        SpawnNextSpot();
    }

    public void SpawnNextSpot()
    {
        if (spt != null)
        {
            Destroy(spt);
        }
        if (spawnedSpots < spotNo)
        {
            spt = Instantiate(spot, transform);
            spt.transform.localPosition = new Vector3(Random.Range(bounds.min.x, bounds.max.x), 5.0f, Random.Range(bounds.min.z, bounds.max.z));
            spawnedSpots++;
        } else
        {
            finished = true;
        }
    }

    public bool isFinished()
    {
        return finished;
    }

    public void AddScore()
    {
        score++;
    }

    public float GetScore()
    {
        return score / spotNo;
    }
}
