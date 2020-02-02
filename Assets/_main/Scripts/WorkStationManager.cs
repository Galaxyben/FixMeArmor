using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

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
    [Header("Watches")]
    public WorkStationName currentStation;

    private Sequence sequence;

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
    }

    private void Update()
    {
        stations[(int)currentStation].ws?.Use();
    }

    public void ChangeStation(WorkStationName _nextStation)
    {
        if (_nextStation == currentStation || sequence.active)
        {
            if (!sequence.active)
                Debug.Log("Requesting to change to the current workStation");
            else
                Debug.Log("Requesting a work station change while a change is ongoing");
            return;
        }

        sequence = DOTween.Sequence();
        fade.gameObject.SetActive(true);
        sequence.Append(fade.DOColor(new Color(0, 0, 0, 1), 0.6f));

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

        sequence.Append(fade.DOColor(new Color(0, 0, 0, 0), 6f));
        sequence.AppendCallback(() => fade.gameObject.SetActive(false));
    }

    public void SetStationsStatus(WorkStationName _active)
    {
        for(int i = 0; i < stations.Length; i++)
        {
            bool activate = i == (int)_active;

            var s = stations[i];
            s.ws.enabled = activate;
            foreach (var mb in s.monos)
                mb.enabled = activate;
            foreach (var go in s.gameObjects)
                go.SetActive(activate);

            if (activate)
            {
                s.ws.onWorkFinish += OnWorkFinished;
            }

            if(i == (int)currentStation)
            {
                s.ws.onWorkFinish -= OnWorkFinished; //Unsubscribing from previous
            }
        }
        currentStation = _active;
    }

    public void OnWorkFinished()
    {
        mm.scores.Add(stations[(int)currentStation].ws.GetScore());
    }
}
