using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Soldering : MonoBehaviour
{
    public Transform solderingObject;
    public GameObject soldureBit;
    public float soldureBitRadius;
    public LayerMask layerMask;

    private Transform previousPoint;

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
            if(Physics.Raycast(ray, out hit, 10f, layerMask))
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

                if(instantiate)
                {
                    GameObject go = Instantiate(soldureBit, hit.point, Quaternion.identity, hit.collider.transform);
                    go.transform.localScale = Vector3.Scale(go.transform.localScale, new Vector3(1f / hit.collider.transform.localScale.x, 1f / hit.collider.transform.localScale.y, 1f / hit.collider.transform.localScale.z)); //Normalizing scale
                    go.transform.rotation = Quaternion.LookRotation(Vector3.Cross(hit.normal, Vector3.right), hit.normal) * go.transform.rotation;
                    previousPoint = go.transform;
                }
            }
        }
    }
}
