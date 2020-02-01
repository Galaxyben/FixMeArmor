using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Mangos 
{
    public enum Sounds : int
    {
        
    }

	public class ManagerAudio : MonoBehaviour {

		[Tooltip("Es un emptyObject con un audio Soruce")]
		public GameObject audioDad;
		public Camera cam;
		public AudioClip mainMenu;

        public AudioClip[] clips;

		void SetVolumenGeneral(float value)
		{
			ManagerStatic.GeneralVolumen = value;
		}

		void Awake()
		{
			ManagerStatic.audioManager = this;
		}

		void Start()
		{
			if (ManagerStatic.gameStateManager.currentState == GameState.MAIN_MENU)
				PlayMusic (mainMenu);
		}

		public void PlaySoundAt (Vector3 pos, AudioClip clip)
		{
			GameObject sound = Instantiate (audioDad, pos, Quaternion.identity);
			sound.GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
			sound.GetComponent<AudioSource> ().PlayOneShot (clip);
			Destroy (sound, clip.length + 0.1f);
		}

        public void PlaySoundAt(Vector3 pos, Sounds clip)
        {
            GameObject sound = Instantiate(audioDad, pos, Quaternion.identity);
			sound.GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
            sound.GetComponent<AudioSource>().PlayOneShot(clips[(int)clip]);
            Destroy(sound, clips[(int)clip].length + 0.1f);
        }

        public void PlaySoundGlobal(AudioClip clip)
		{
			GameObject sound = Instantiate (audioDad, cam.transform.position, Quaternion.identity, cam.transform);
			sound.GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
			sound.GetComponent<AudioSource> ().PlayOneShot (clip);
			Destroy (sound, clip.length + 0.1f);
		}

        public void PlaySoundGlobal(Sounds clip)
        {
            GameObject sound = Instantiate(audioDad, cam.transform.position, Quaternion.identity, cam.transform);
			sound.GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
            sound.GetComponent<AudioSource>().PlayOneShot(clips[(int)clip]);
            Destroy(sound, clips[(int)clip].length + 0.1f);
        }

        public void PlayMusic(AudioClip clip)
		{
			if (!GameObject.Find("jukebox"))
			{
				GameObject jukebox = Instantiate (audioDad, cam.transform.position, Quaternion.identity, cam.transform);
				jukebox.gameObject.name = "jukebox";
				jukebox.GetComponent<AudioSource> ().clip = clip;
				jukebox.GetComponent<AudioSource> ().loop = true;
				jukebox.GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
				jukebox.GetComponent<AudioSource> ().Play ();
			}
			else
			{
				GameObject.Find ("jukebox").GetComponent<AudioSource> ().clip = clip;
				GameObject.Find("jukebox").GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
				GameObject.Find ("jukebox").GetComponent<AudioSource> ().Play();
			}
		}

        public void PlayMusic(Sounds clip)
        {
            if (!GameObject.Find("jukebox"))
            {
                GameObject jukebox = Instantiate(audioDad, cam.transform.position, Quaternion.identity, cam.transform);
                jukebox.gameObject.name = "jukebox";
                jukebox.GetComponent<AudioSource>().clip = clips[(int)clip];
                jukebox.GetComponent<AudioSource>().loop = true;
				jukebox.GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
                jukebox.GetComponent<AudioSource>().Play();
            }
            else
            {
                GameObject.Find("jukebox").GetComponent<AudioSource>().clip = clips[(int)clip];
				GameObject.Find("jukebox").GetComponent<AudioSource> ().volume = ManagerStatic.GeneralVolumen / 100;
                GameObject.Find("jukebox").GetComponent<AudioSource>().Play();
            }
        }

        public void StopMusic()
		{
			if (GameObject.Find("jukebox"))
			{
				GameObject.Find ("jukebox").GetComponent<AudioSource> ().Stop ();
				Destroy (GameObject.Find("jukebox"));
			}
		}
	}
}
