// MySQL 접속 설정의 정보를 저장
// MySQL에 접속 중인 상태 정보를 이용해 다른 class에서 DB에 접근
// 때문에 conn.close() 사용하지 않음

import 'package:mysql_client/mysql_client.dart';
import 'dbInfo.dart';

Future<MySQLConnection> dbConnector() async {
  print("Connecting ...");

  final conn = await MySQLConnection.createConnection(
    host: DbInfo.hostName,
    port: DbInfo.portNumber,
    userName: DbInfo.userName,
    password: DbInfo.password,
    databaseName: DbInfo.dbName,
  );

  await conn.connect();

  print("Connected");

  return conn;
}
