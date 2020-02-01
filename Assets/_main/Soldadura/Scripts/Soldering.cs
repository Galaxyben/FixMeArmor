using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Soldering : MonoBehaviour
{
    public Collider[] partColliders;
    public GameObject soldureBit;
    public float soldureBitRadius;
    public LayerMask layerMask;
    public int bitCountDesired;

    private Transform previousPoint;
    [SerializeField] private List<SolderingBit.Status> statuses = new List<SolderingBit.Status>();

    void Update()
    {
        //todo quitar luego yada yada
        Use();
    }

    public void Use()
    {
        if (Input.GetMouseButtonDown(0) || Input.GetMouseButton(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit, 10f, layerMask))
            {
                bool instantiate = false;
                if (previousPoint) //Para el primer punto que se pone porque siempre empieza en null
                {
                    if (Vector3.Distance(hit.point, previousPoint.position) > soldureBitRadius) //Aca si checo que sea suficientemente lejos
                    {
                        instantiate = true;
                    }
                }
                else
                {
                    instantiate = true;
                }

                if (instantiate)
                {
                    GameObject go = Instantiate(soldureBit, hit.point, Quaternion.identity, hit.collider.transform);
                    go.transform.localScale = Vector3.Scale(go.transform.localScale, new Vector3(1f / hit.collider.transform.localScale.x, 1f / hit.collider.transform.localScale.y, 1f / hit.collider.transform.localScale.z)); //Normalizing scale
                    go.transform.rotation = Quaternion.LookRotation(Vector3.Cross(hit.normal, Vector3.right), hit.normal) * go.transform.rotation;
                    previousPoint = go.transform;

                    //Soldure setup
                    SolderingBit sb = go.GetComponent<SolderingBit>();
                    if (sb)
                    {
                        foreach (var c in partColliders)
                        {
                            sb.AddPartCollider(c);
                        }
                        sb.SetCallback(AddBitStatus);
                    }
                }
            }
        }
    }

    void AddBitStatus(SolderingBit.Status _status)
    {
        statuses.Add(_status);
    }

    public float GetScore()
    {
        float result = 0;
        int foul = 0;
        foreach (var s in statuses)
        {
            switch (s)
            {
                case SolderingBit.Status.SUCCESSFUL:
                    result++;
                    break;
                case SolderingBit.Status.BAD_ON_TARGET:
                    result -= 0.2f;
                    break;
                case SolderingBit.Status.OFF_TARGET:
                    foul++;
                    break;
            }
        }
        if (statuses.Count > foul)
        {
            result /= (statuses.Count - foul);
        }
        float maxPossible = Mathf.Min(bitCountDesired / (statuses.Count - foul), 1);
        return result * maxPossible;
    }

    private void OnValidate()
    {
        if (!soldureBit.GetComponent<SolderingBit>())
        {
            soldureBit = null;
        }
    }
}