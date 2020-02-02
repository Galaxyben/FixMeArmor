using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HammerSpotSpawner : MonoBehaviour
{
    public GameObject spot;

    private int spawnedSpots = 0;
    private int score = 0;
    private Bounds bounds;

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
        if (spawnedSpots < 5)
        {
            spt = Instantiate(spot, transform);
            spt.transform.localPosition = new Vector3(Random.Range(bounds.min.x, bounds.max.x), 5.0f, Random.Range(bounds.min.z, bounds.max.z));
            spawnedSpots++;
        } else
        {
            Debug.Log("Finished Hammering With A Score Of : " + GetScore());
        }
    }

    public void AddScore()
    {
        score++;
    }

    public int GetScore()
    {
        return score;
    }
}
