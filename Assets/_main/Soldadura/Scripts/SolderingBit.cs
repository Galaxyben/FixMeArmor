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
    List<Collider> parts = new List<Collider>();
    System.Action<Status> callback;

    private void Start()
    {
        CheckStatus();
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

    private void OnCollisionStay(Collision collision)
    {
        Debug.Log("Collision Stay");
    }
}
