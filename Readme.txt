1. Put lib, models folders and RESTful_CDppTest.jar under RISE_Test folder, assume ¡°E:\RISE_Test¡±. 

2. Put 4 shell scripts (delete_FallRockV2Model.bat; create_FallRockV2Model.bat; submit_FallRockV2Model.bat; run_FallRockV2Model.bat), FallRockV2.xml and FallRockV2.zip files under ¡°E:\RISE_Test¡±.

3. As the init.val and initial.stvalues are already generated, so it does not require assigning initial values to cells. In this case, the cells (4,2,4), (4,2,5), (4,4,8) and (4,10,14) are assigned state variable values- stateVal (2) and kineticEnergy (500). If you want to modify it, please open the initial.stvalues, modify and save. Otherwise, just skip this step.

4. It is required to delete the old version in the server by clicking delete_FallRockV2Model.bat file.

5. Create your workspace, DCD++ service and a framework by clicking create_FallRockV2Model.bat file.

6. Submit the FallRockV2 model files to your framework URI by clicking submit_FallRockV2Model.bat file.   

7. Run the FallRockV2 simulation by clicking run_FallRockV2Model.bat file. 

8. Open the website: 134.117.53.66:8080/cdpp/sim/workspaces/test/lopez/

9. Find and click FallRockV2Model Framework and then click Download Last Simulation Results. 
