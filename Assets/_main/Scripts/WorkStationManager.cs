using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using Doozy.Engine;

public class WorkStationManager : MonoBehaviour
{
    [System.Serializable]
    public struct WorkStationObjects
    {
        public string name;
        public WorkStation ws;
        public List<MonoBehaviour> monos;
        public List<GameObject> gameObjects;

        public WorkStationObjects(string name, WorkStation ws, List<MonoBehaviour> monos, List<GameObject> gameObjects)
        {
            this.name = name;
            this.ws = ws;
            this.monos = monos;
            this.gameObjects = gameObjects;
        }
    }

    public enum WorkStationName
    {
        BAKE,
        SOLDERING,
        HAMMERING
    }

    [Header("Setup")]
    public MasterManager mm;
    public Image fade;
    [Header("Settings")]
    public WorkStationObjects[] stations = new WorkStationObjects[System.Enum.GetNames(typeof(WorkStationName)).Length];
    public float fadeTime = 0.8f;
    [Header("Watches")]
    public WorkStationName currentStation;

    private Sequence sequence;
    private bool isSequenceRunning = false;

    private void OnValidate()
    {
        if(stations != null)
        {
            if(stations.Length != System.Enum.GetNames(typeof(WorkStationName)).Length)
            {
                stations = new WorkStationObjects[System.Enum.GetNames(typeof(WorkStationName)).Length];
            }
        }
        else
        {
            stations = new WorkStationObjects[System.Enum.GetNames(typeof(WorkStationName)).Length];
        }
    }

    private void Start()
    {
        fade.color = new Color(0, 0, 0, 0);
        fade.gameObject.SetActive(false);
        sequence = DOTween.Sequence();
        ChangeStation(currentStation, false);
    }

    private void Update()
    {
        stations[(int)currentStation].ws?.Use();
    }

    public void NextStation()
    {
        var vals = System.Enum.GetValues(typeof(WorkStationName));
        for(int i = 0; i < vals.Length; i++)
        {
            if (i == (int)currentStation)
            {
                if(i < vals.Length-1)
                {
                    ChangeStation((WorkStationName)(i + 1));
                }
            }
        }
    }

    public void ChangeStation(WorkStationName _nextStation, bool fadeOut = true)
    {
        Debug.Log("Changing station");
        if (isSequenceRunning)
        {
            Debug.Log("Requesting a work station change while a change is ongoing");
            return;
        }

        sequence = DOTween.Sequence();
        fade.gameObject.SetActive(true);
        if (fadeOut)
        {
            sequence.Append(fade.DOColor(Color.black, fadeTime));
        }
        else {
            fade.color = Color.black;
        }

        switch (_nextStation)
        {
            case WorkStationName.BAKE:
                sequence.AppendCallback(() => { mm.SetBake(); SetStationsStatus(_nextStation); });
                break;
            case WorkStationName.SOLDERING:
                sequence.AppendCallback(() => { mm.SetSoldering(); SetStationsStatus(_nextStation); });
                break;
            case WorkStationName.HAMMERING:
                sequence.AppendCallback(() => { mm.SetHammering(); SetStationsStatus(_nextStation); });
                break;
        }

        sequence.Append(fade.DOColor(new Color(0, 0, 0, 0), fadeTime));
        sequence.AppendCallback(() => fade.gameObject.SetActive(false));
        sequence.OnComplete(() => isSequenceRunning = false);
        sequence.Play();
        isSequenceRunning = true;
    }

    public void SetStationsStatus(WorkStationName _active)
    {
        Debug.Log("Activating " + _active.ToString());
        for (int i = 0; i < stations.Length; i++)
        {
            bool activate = i == (int)_active;

            var s = stations[i];
            s.ws.enabled = activate;
            foreach (var mb in s.monos)
                mb.enabled = activate;
            foreach (var go in s.gameObjects)
                go.SetActive(activate);


            if (i == (int)currentStation)
            {
                s.ws.onWorkFinish -= OnWorkFinished; //Unsubscribing from previous
            }

            if (activate)
            {
                Debug.Log("Subscribing to " + s.name);
                s.ws.onWorkFinish += OnWorkFinished;
            }
        }
        currentStation = _active;
    }

    public void OnWorkFinished()
    {
        Debug.Log("Work Finished");
        mm.scores.Add(stations[(int)currentStation].ws.GetScore());
        GameEventMessage.SendEvent("Finished");
    }
}
