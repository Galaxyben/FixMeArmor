using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;


[CustomEditor(typeof(temp))]
public class EditorTemp : Editor
{
    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();
        temp s = (temp)target;

        if(GUILayout.Button("Doit"))
        {
            s.doit();
        }
    }
}
