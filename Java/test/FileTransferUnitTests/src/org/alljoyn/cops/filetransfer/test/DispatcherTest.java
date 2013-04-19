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

package org.alljoyn.cops.filetransfer.test;

import org.alljoyn.cops.filetransfer.DirectedAnnouncementManager;
import org.alljoyn.cops.filetransfer.Dispatcher;
import org.alljoyn.cops.filetransfer.SendManager;
import org.alljoyn.cops.filetransfer.Transmitter;
import org.alljoyn.cops.filetransfer.data.Action;
import org.alljoyn.cops.filetransfer.data.Action.ActionType;
import org.alljoyn.cops.filetransfer.listener.DirectedAnnouncementManagerListener;
import org.alljoyn.cops.filetransfer.listener.SendManagerListener;

import android.test.AndroidTestCase;

public class DispatcherTest extends AndroidTestCase 
{
	private Dispatcher dispatcher;
	private MockTransmitter mockTransmitter;
	private MockDirectedAnnouncementManager mockDirectedAnnouncementManager;
	private MockSendManager mockSendManager;

	protected void setUp() throws Exception 
	{
		super.setUp();
		
		this.mockTransmitter = new MockTransmitter();
		this.dispatcher = new Dispatcher(mockTransmitter);
		this.mockDirectedAnnouncementManager = new MockDirectedAnnouncementManager(dispatcher);
		this.mockSendManager = new MockSendManager(dispatcher);
		
		dispatcher.setDirectedAnnouncementManagerListener(mockDirectedAnnouncementManager);
		dispatcher.setSendManagerListener(mockSendManager);
		new Thread(dispatcher).start();
	}

	protected void tearDown() throws Exception 
	{
		super.tearDown();
	}

	public void testInsertAction() 
	{
		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.ANNOUNCE, action.actionType);
			}
		});

		Action action = createAnnounceAction();		
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}

		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.REQUEST_ANNOUNCE, action.actionType);
			}
		});
		
		action = createRequestAnnounceAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}
		
		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.REQUEST_OFFER, action.actionType);
			}
		});
		
		action = createRequestIdAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}
		
		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.REQUEST_DATA, action.actionType);
			}
		});
		
		action = createRequestDataAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}
		
		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.DATA_CHUNK, action.actionType);
			}
		});
		
		action = createDataChunkAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}
		
		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.OFFER_FILE, action.actionType);
			}
		});
		
		action = createOfferFileAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}
		
		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.STOP_XFER, action.actionType);
			}
		});

		action = createStopXferAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}
		
		mockTransmitter.setTestListener(new TestListener()
		{
			public void sendBackAction(Action action)
			{
				assertEquals(ActionType.XFER_CANCELLED, action.actionType);
			}
		});
		
		action = createXferCancelledAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}

		action = createFileIdResponseAction();
		dispatcher.insertAction(action);
		
		try
		{
			Thread.sleep(1000);
		}
		catch (Exception ex)
		{
			
		}
	}
	
	private Action createAnnounceAction()
	{
		Action action = new Action();
		action.actionType = ActionType.ANNOUNCE;
		
		return action;
	}
	
	private Action createRequestAnnounceAction()
	{
		Action action = new Action();
		action.actionType = ActionType.REQUEST_ANNOUNCE;
		
		return action;
	}
	
	private Action createRequestIdAction()
	{
		Action action = new Action();
		action.actionType = ActionType.REQUEST_OFFER;
		
		return action;
	}
	
	private Action createRequestDataAction()
	{
		Action action = new Action();
		action.actionType = ActionType.REQUEST_DATA;
		
		return action;
	}
	
	private Action createDataChunkAction()
	{
		Action action = new Action();
		action.actionType = ActionType.DATA_CHUNK;
		
		return action;
	}
	
	private Action createOfferFileAction()
	{
		Action action = new Action();
		action.actionType = ActionType.OFFER_FILE;
		
		return action;
	}	
	
	private Action createStopXferAction()
	{
		Action action = new Action();
		action.actionType = ActionType.STOP_XFER;
		
		return action;
	}
	
	private Action createXferCancelledAction()
	{
		Action action = new Action();
		action.actionType = ActionType.XFER_CANCELLED;
		
		return action;
	}
	
	private Action createFileIdResponseAction()
	{
		Action action = new Action();
		action.actionType = ActionType.FILE_ID_RESPONSE;
		
		return action;
	}

	public void testRegisterDataSentListener() 
	{
		assertTrue(true);
	}

	public void testRegisterGenerateIdListener() 
	{
		assertTrue(true);
	}

	//Class MockTransmitter
	private class MockTransmitter extends Transmitter
	{
		TestListener listener;
		
		public MockTransmitter() 
		{
			super(null, null, 0);
		}
		
		public void setTestListener(TestListener listener)
		{
			this.listener = listener;
		}

		@Override
		public int transmit(Action action)
		{
			if (listener != null)
			{
				listener.sendBackAction(action);
			}
			return 0;
		}
	}
	
	//Class MockAnnouncer
	private class MockDirectedAnnouncementManager extends DirectedAnnouncementManager
			implements DirectedAnnouncementManagerListener
	{

		public MockDirectedAnnouncementManager(Dispatcher dispatcher) 
		{
			super(dispatcher, null, "");
		}
		
		@Override
		public void generateFileDescriptor(Action action)
		{
			System.out.println("MockAnnouncer - generateFileDescriptor() called");
			assertEquals(ActionType.FILE_ID_RESPONSE, action.actionType);
		}
	}
	
	private class MockSendManager extends SendManager implements SendManagerListener
	{

		public MockSendManager(Dispatcher dispatcher) 
		{
			super(dispatcher, null);
		}
		
		@Override
		public void dataSent()
		{
			System.out.println("MockFTM - reached dataSent() function on callback");
		}
	}
	
	private interface TestListener
	{
		public void sendBackAction(Action action);
	}
}
