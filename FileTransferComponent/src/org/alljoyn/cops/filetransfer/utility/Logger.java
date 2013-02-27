/*******************************************************************************
* Copyright 2012 - 2013, Qualcomm Innovation Center, Inc.
*
*    Licensed under the Apache License, Version 2.0 (the "License");
*    you may not use this file except in compliance with the License.
*    You may obtain a copy of the License at
*
*        http://www.apache.org/licenses/LICENSE-2.0
*
*    Unless required by applicable law or agreed to in writing, software
*    distributed under the License is distributed on an "AS IS" BASIS,
*    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*    See the License for the specific language governing permissions and
*    limitations under the License.
******************************************************************************/

package org.alljoyn.cops.filetransfer.utility;

import android.util.Log;

/**
 * Utility class to log messages to the Android utility, LogCat
 */
public class Logger
{
	private static final String LOG_TAG = "filetransfer";
	
	/**
	 * log()
	 * is used to log messages to LogCat. 
	 * 
	 * @param message  the message to print
	 */
	public static void log(String message)
	{
		Log.d(LOG_TAG, message);
	}
}
