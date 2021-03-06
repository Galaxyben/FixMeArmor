﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemExaminer : MonoBehaviour
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
        if(Input.GetMouseButtonDown(1))
        {
            previousMousePos = Input.mousePosition;
        }
        if(Input.GetMouseButton(1))
        {
            Vector2 currentPosition = Input.mousePosition;
            Vector2 deltaPos = previousMousePos - currentPosition;

            Vector3 camRight = Vector3.ProjectOnPlane(Camera.main.transform.right, Vector3.up);
            //Vector3 eulers = new Vector3(0, deltaPos.x, -deltaPos.y)*sensitivity;
            Vector3 eulers = (Vector3.up * (freezeY ? 0 : deltaPos.x) + camRight * (freezeX ? 0 : deltaPos.y)) * sensitivity;

            item.Rotate(eulers * Time.deltaTime, Space.World);

            //TODO: cambiar a que sea relativo a la camara talvez

            previousMousePos = currentPosition;
        }
    }
}
