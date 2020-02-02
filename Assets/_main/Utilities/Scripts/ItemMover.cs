using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemMover : MonoBehaviour
{
    public Transform item;
    public float sensitivity;
    public bool freezeX = false;
    public bool freezeY = false;

    private Vector2 previousMousePos;

    private void Update()
    {
        //Debugging. TODO: Hacer esto desde un manager de inputs
        Use();
    }

    public void Use()
    {
        if(Input.GetMouseButtonDown(0))
        {
            previousMousePos = Input.mousePosition;
        }
        if(Input.GetMouseButton(0))
        {
            Vector2 currentPosition = Input.mousePosition;
            Vector2 deltaPos = previousMousePos - currentPosition;

            Vector3 translate = new Vector3(freezeX ? 0 : deltaPos.x, 0, freezeY ? 0 : deltaPos.y) * -sensitivity;

            item.Translate(translate * Time.deltaTime, Space.World);

            //TODO: cambiar a que sea relativo a la camara talvez

            previousMousePos = currentPosition;
        }
    }
}
