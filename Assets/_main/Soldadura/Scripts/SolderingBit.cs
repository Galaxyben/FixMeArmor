using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SolderingBit : MonoBehaviour
{
    public enum Status
    {
        SUCCESSFUL,
        BAD_ON_TARGET,
        OFF_TARGET
    }

    public Status status;
    public float emissionIntensity = 1f;
    public float unheatTime = 1f;
    private float startTime;
    public Color ogColor;

    private bool blockIsSet = false;

    Renderer rend;
    MaterialPropertyBlock propertyBlock;
    List<Collider> parts = new List<Collider>();
    System.Action<Status> callback;

    private void Start()
    {
        CheckStatus();
        startTime = Time.time;
        rend = GetComponent<Renderer>();
        ogColor = rend.material.GetColor("_MainColor");
        propertyBlock = new MaterialPropertyBlock();
        rend.GetPropertyBlock(propertyBlock);
        propertyBlock.SetVector("_LocalPosition", new Vector4(transform.localPosition.x, transform.localPosition.y, transform.localPosition.z, 1));
        rend.SetPropertyBlock(propertyBlock);
    }

    public void AddPartCollider(Collider _part)
    {
        parts.Add(_part);
    }

    public void SetCallback(System.Action<Status> action)
    {
        callback = action;
    }

    void CheckStatus()
    {
        if (callback != null)
        {
            Collider[] collision = Physics.OverlapSphere(transform.position - Vector3.up * 0.002f, 0.004f);

            int successScore = 0;
            for (int i = 0; i < collision.Length; i++)
            {
                if (parts.Contains(collision[i]))
                {
                    successScore++;
                    if (successScore >= 2)
                        break;
                }
            }

            if (successScore >= 2)
            {
                status = Status.SUCCESSFUL;
            }
            else if (successScore == 1)
            {
                status = Status.BAD_ON_TARGET;
            }
            else
            {
                status = Status.OFF_TARGET;
            }

            callback.Invoke(status);
        }
    }

    private void Update()
    {
        rend.GetPropertyBlock(propertyBlock);
        propertyBlock.SetVector("_LocalPosition", new Vector4(transform.localPosition.x, transform.localPosition.y, transform.localPosition.z, 1));
        rend.SetPropertyBlock(propertyBlock);
        if (Time.time < startTime + unheatTime)
        {
            float n = (Time.time - startTime) / unheatTime;
            rend.GetPropertyBlock(propertyBlock);
            propertyBlock.SetColor("_MainColor", Color.Lerp(Color.red, ogColor, n));
            propertyBlock.SetColor("_EmissionColor", Color.Lerp(Color.red, Color.white, n));
            propertyBlock.SetFloat("_EmissionPower", (1-n)*emissionIntensity);
            rend.SetPropertyBlock(propertyBlock);
        }
        else if(!blockIsSet)
        {
            rend.GetPropertyBlock(propertyBlock);
            propertyBlock.SetColor("_MainColor", ogColor);
            propertyBlock.SetColor("_EmissionColor", Color.white);
            propertyBlock.SetFloat("_EmissionPower", 0);
            rend.SetPropertyBlock(propertyBlock);
        }
    }

    private void OnCollisionStay(Collision collision)
    {
        Debug.Log("Collision Stay");
    }
}
