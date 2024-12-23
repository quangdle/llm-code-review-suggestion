CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:4, properties:{name:"JavaScript", id:"js"}}, {_id:5, properties:{name:"Python", id:"py"}}, {_id:6, properties:{name:"ReactJS", id:"reactjs"}}, {_id:7, properties:{name:"Typescript", id:"ts"}}, {_id:8, properties:{name:"CI/CD", id:"cicd"}}, {_id:9, properties:{name:"Platform", id:"platform"}}, {_id:10, properties:{name:"Ruby", id:"ruby"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Skill;
UNWIND [{_id:15, properties:{domains:["ATS"], description:"Fixes a critical bug to ATS", id:"PR1", title:"Fix Bug", timestamp:"2024-12-15"}}, {_id:16, properties:{domains:["SmartMatch"], description:"Adds a new feature to SmartMatch", id:"PR2", title:"Add Feature", timestamp:"2024-12-14"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:PR;
UNWIND [{_id:11, properties:{name:"Helios", domains:["Global Teams", "SmartMatch"], id:"helios"}}, {_id:12, properties:{name:"Konoha", domains:["ATS"], id:"konoha"}}, {_id:13, properties:{name:"Web Platform", domains:["Core Tech"], id:"web-platform"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:0, properties:{review_score:50.0, name:"Quang", code_review_frequent:4, availability:5, id:"quang", responsiveness:2}}, {_id:1, properties:{review_score:99.0, name:"Sang", code_review_frequent:4, availability:5, id:"sang", responsiveness:5}}, {_id:2, properties:{review_score:60.0, name:"Hani", code_review_frequent:4, availability:3, id:"hani", responsiveness:5}}, {_id:3, properties:{review_score:80.0, name:"Duong", code_review_frequent:4, availability:3, id:"duong", responsiveness:2}}, {_id:14, properties:{review_score:85.0, name:"Nhi", code_review_frequent:4, availability:3, id:"nhi", responsiveness:5}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Developer;
UNWIND [{_id:17, properties:{name:"file1.js", id:"F1"}}, {_id:18, properties:{name:"file2.py", id:"F2"}}, {_id:19, properties:{name:"file3.ts", id:"F3"}}, {_id:20, properties:{name:"file4.rb", id:"F4"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:File;
UNWIND [{start: {_id:0}, end: {_id:6}, properties:{level:4}}, {start: {_id:0}, end: {_id:7}, properties:{level:4}}, {start: {_id:1}, end: {_id:6}, properties:{level:5}}, {start: {_id:1}, end: {_id:7}, properties:{level:4}}, {start: {_id:1}, end: {_id:8}, properties:{level:5}}, {start: {_id:1}, end: {_id:9}, properties:{level:5}}, {start: {_id:2}, end: {_id:6}, properties:{level:3}}, {start: {_id:2}, end: {_id:7}, properties:{level:3}}, {start: {_id:3}, end: {_id:10}, properties:{level:5}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DEVELOPER_HAS_SKILL]->(end) SET r += row.properties;
UNWIND [{start: {_id:1}, end: {_id:11}, properties:{}}, {start: {_id:2}, end: {_id:11}, properties:{}}, {start: {_id:14}, end: {_id:12}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:IS_MEMBER_OF_TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:3}, end: {_id:11}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:LEADER_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:3}, end: {_id:14}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MENTOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:11}, end: {_id:18}, properties:{}}, {start: {_id:11}, end: {_id:20}, properties:{}}, {start: {_id:12}, end: {_id:17}, properties:{}}, {start: {_id:12}, end: {_id:19}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CODEOWNER_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:15}, end: {_id:18}, properties:{}}, {start: {_id:15}, end: {_id:20}, properties:{}}, {start: {_id:16}, end: {_id:17}, properties:{}}, {start: {_id:16}, end: {_id:19}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PR_AFFECTS_FILE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1}, end: {_id:16}, properties:{review_score:85}}, {start: {_id:2}, end: {_id:16}, properties:{review_score:50}}, {start: {_id:14}, end: {_id:15}, properties:{review_score:50}}, {start: {_id:14}, end: {_id:15}, properties:{review_score:50}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DEVELOPER_REVIEWED]->(end) SET r += row.properties;
UNWIND [{start: {_id:0}, end: {_id:16}, properties:{}}, {start: {_id:3}, end: {_id:15}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DEVELOPER_CONTRIBUTED_TO]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;