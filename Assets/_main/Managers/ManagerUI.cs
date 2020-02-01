using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Mangos
{
	public class ManagerUI : MonoBehaviour {

		void Awake()
		{
			ManagerStatic.uiManager = this;
		}
	}
}
