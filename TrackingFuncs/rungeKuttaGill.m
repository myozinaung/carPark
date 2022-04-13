function next_state_vec = rungeKuttaGill(current_time, current_state_vec, control_input_vec, sampling_period,para)

    k1_vec = stateFunc(current_time, current_state_vec, control_input_vec,para);
    tmp_vec = current_state_vec + 0.5*sampling_period.*k1_vec;

    k2_vec = stateFunc(current_time+0.5*sampling_period, tmp_vec, control_input_vec,para);
    tmp_vec = current_state_vec + sampling_period.*0.5.*(sqrt(2)-1).*k1_vec + sampling_period.*(1-(1/sqrt(2)))*k2_vec;

    k3_vec = stateFunc(current_time+0.5*sampling_period, tmp_vec, control_input_vec,para);
    tmp_vec = current_state_vec - sampling_period.*0.5.*sqrt(2).*k2_vec + sampling_period.*(1+(1/sqrt(2))).*k3_vec;

    k4_vec = stateFunc(current_time+sampling_period, tmp_vec, control_input_vec,para);
    next_state_vec = current_state_vec + sampling_period.*(k1_vec+(2-sqrt(2)).*k2_vec+(2+sqrt(2)).*k3_vec+k4_vec)./6;
    
    %% Using MEX State Function (NO Wind function)
%     k1_vec = stateFunc_mex(current_time, current_state_vec, control_input_vec,para);
%     tmp_vec = current_state_vec + 0.5*sampling_period.*k1_vec;
% 
%     k2_vec = stateFunc_mex(current_time+0.5*sampling_period, tmp_vec, control_input_vec,para);
%     tmp_vec = current_state_vec + sampling_period.*0.5.*(sqrt(2)-1).*k1_vec + sampling_period.*(1-(1/sqrt(2)))*k2_vec;
% 
%     k3_vec = stateFunc_mex(current_time+0.5*sampling_period, tmp_vec, control_input_vec,para);
%     tmp_vec = current_state_vec - sampling_period.*0.5.*sqrt(2).*k2_vec + sampling_period.*(1+(1/sqrt(2))).*k3_vec;
% 
%     k4_vec = stateFunc_mex(current_time+sampling_period, tmp_vec, control_input_vec,para);
%     next_state_vec = current_state_vec + sampling_period.*(k1_vec+(2-sqrt(2)).*k2_vec+(2+sqrt(2)).*k3_vec+k4_vec)./6;

end