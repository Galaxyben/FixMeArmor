using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public delegate void WorkEvent();

public abstract class WorkStation : MonoBehaviour
{
    public abstract void Use();
    public abstract float GetScore();

    public WorkEvent onWorkFinish;
}
