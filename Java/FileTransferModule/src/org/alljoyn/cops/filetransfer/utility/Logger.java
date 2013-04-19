/******************************************************************************
 * Copyright 2013, Qualcomm Innovation Center, Inc.
 *
 *    All rights reserved.
 *    This file is licensed under the 3-clause BSD license in the NOTICE.txt
 *    file for this project. A copy of the 3-clause BSD license is found at:
 *
 *        http://opensource.org/licenses/BSD-3-Clause.
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the license is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the license for the specific language governing permissions and
 *    limitations under the license.
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
