using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Doozy.Engine.Progress;
using UnityEngine.UI;
using TMPro;

public class NailOven : WorkStation
{
    public float maxTime, goalTime, currentTime;
    [Range(0.0f, 100.0f)]
    public float accurencyTime;
    public Vector2 timeRangeSucces;
    public GameObject nail;
    bool Stop = false;
    [SerializeField]
    bool isOpen = true;
    bool firtTime = true;
    [Header("Data COOK")]
    public bool toEarly; 
    public bool okay, toLate;
    [Header("Animator")]
    public Animator anim;
    public Image img;
    public Sprite[] lingotes;
    public TextMeshProUGUI textResult;
    [Header("COSAS DEL PEPE")]
    public Progressor progressor;
    
    void Start()
    {
        Init();
        progressor.SetMax(maxTime);
        //StartCook();
    }

    void Init()
    {
        float omega = (1 - (accurencyTime / 100.0f)) * goalTime / 100.0f;
        timeRangeSucces.x = Mathf.Floor(goalTime - omega);
        timeRangeSucces.y = Mathf.Ceil(goalTime + omega);
    }

    public void ChangeState()
    {
        if(firtTime)
        {
            anim.SetTrigger("OpenOven");
            firtTime = false;
        }
        else if(!firtTime && isOpen)
        {
            anim.SetTrigger("CloseOven");
            Invoke("ChangeStateOven", 1.5f);
        }
        else if (!firtTime && !isOpen)
        {
            anim.SetTrigger("OpenOven");
            StopCook();
            isOpen = true;
        }
    }

    public void ChangeStateOven()
    {
        isOpen = false;
    }
    
    void Update()
    {
        
    }

    public void StopCook()
    {
        Debug.Log("Stop Cook");
        Stop = true;
        CheckIsOK();
        onWorkFinish?.Invoke();
    }

    public void CheckIsOK()
    {
        if(currentTime < timeRangeSucces.x)
        {
            toEarly = true;
            okay = false;
            toLate = false;
            img.sprite = lingotes[0];
            img.color = Color.white;
            img.gameObject.SetActive(true);
            textResult.text = "To Early";
        }
        else if(currentTime >= timeRangeSucces.x && currentTime <= timeRangeSucces.y)
        {
            okay = true;
            toLate = false;
            toEarly = false;
            img.sprite = lingotes[1];
            img.color = Color.white;
            img.gameObject.SetActive(true);
            textResult.text = "Excelent";
        }
        else
        {
            toLate = true;
            okay = false;
            toEarly = false;
            img.sprite = lingotes[0];
            img.color = new Color(0.2349873f, 0.23487f, 0.245283f);
            img.gameObject.SetActive(true);
            textResult.text = "To Late";
        }
    }

    public void StartCook()
    {
        //nail.transform.DORotate(new Vector3(0.0f, 0.0f, 450.0f), maxTime, RotateMode.FastBeyond360);
    }

    public override void Use()
    {
        progressor.SetValue(currentTime);

        if (currentTime <= maxTime && !Stop && !isOpen)
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

    public override float GetScore()
    {
        if (toEarly || toLate)
            return 0;
        else if (okay)
            return 1;
        else
            return 0;
    }
}
