using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class NailOven : MonoBehaviour
{
    public float maxTime, goalTime, currentTime;
    [Range(0.0f, 100.0f)]
    public float accurencyTime;
    public Vector2 timeRangeSucces;
    public GameObject nail;
    bool Stop = false;
    bool isOpen = false;
    [Header("Data COOK")]
    public bool toEarly; 
    public bool okay, toLate;


    // Start is called before the first frame update
    void Start()
    {
        Init();
        //StartCook();
    }

    void Init()
    {
        float omega = (1 - (accurencyTime / 100.0f)) * goalTime / 100.0f;
        timeRangeSucces.x = Mathf.Floor(goalTime - omega);
        timeRangeSucces.y = Mathf.Ceil(goalTime + omega);
    }

    // Update is called once per frame
    void Update()
    {
        if (currentTime <= maxTime && !Stop)
        {
            currentTime += Time.deltaTime;
        }
        if (currentTime > maxTime)
        {
            StopCook();
        }
        if (Input.GetKeyDown(KeyCode.Space))
        {
            StopCook();
        }
    }

    public void StopCook()
    {
        Stop = true;
        nail.transform.DOKill();
        CheckIsOK();
    }

    public void CheckIsOK()
    {
        if(currentTime < timeRangeSucces.x)
        {
            toEarly = true;
            okay = false;
            toLate = false;
        }
        else if(currentTime >= timeRangeSucces.x && currentTime <= timeRangeSucces.y)
        {
            okay = true;
            toLate = false;
            toEarly = false;
        }
        else
        {
            toLate = true;
            okay = false;
            toEarly = false;
        }
    }

    public void StartCook()
    {
        nail.transform.DORotate(new Vector3(0.0f, 0.0f, 450.0f), maxTime, RotateMode.FastBeyond360);
    }
}
