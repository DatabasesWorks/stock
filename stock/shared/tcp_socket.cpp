
/*!
	\file

	\author Igor Mironchik (igor.mironchik at gmail dot com).

	Copyright (c) 2018 Igor Mironchik

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

// Stock include.
#include "tcp_socket.hpp"


namespace Stock {

//
// TcpSocketPrivate
//

class TcpSocketPrivate {
public:
	TcpSocketPrivate( TcpSocket * parent )
		:	q( parent )
	{
	}

	//! Parent.
	TcpSocket * q;
}; // class TcpSocketPrivate


//
// TcpSocket
//

TcpSocket::TcpSocket( QObject * parent )
	:	QTcpSocket( parent )
	,	d( new TcpSocketPrivate( this ) )
{
	connect( this, &QTcpSocket::readyRead,
		this, &TcpSocket::dataReceived );
}

TcpSocket::~TcpSocket()
{
}

void
TcpSocket::dataReceived()
{
	readAll();
}

} /* namespace Stock */
