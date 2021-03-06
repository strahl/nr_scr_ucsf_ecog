function nr_timePSD_grp_plot(mean_timePSD_grp_data,sp1,sp2,sp3)

load(mean_timePSD_grp_data)

%% Plot M1
% Display spectrogram data for relevant frequencies only (1-100Hz)
PD2plotM1 = spectrogramPD.M1Zscore(1:200,:); 
% DYS2plotM1 = spectrogramDYS.M1Zscore(1:120,:);
% ET2plotM1 = spectrogramET.M1Zscore(1:120,:);
 
%hf1 = figure;

handle_num = sp3;

sp_eval = ['sp',num2str(handle_num),'= subplot(sp1,sp2,sp3);'];
eval(sp_eval)
assignin_sp_eval = ['assignin(''base'',''sp',num2str(handle_num),''',handle_num)'];
eval(assignin_sp_eval)

% Lump values by std dev 
PD2plotM1(PD2plotM1 >= 2) = 2;
PD2plotM1(1<=PD2plotM1 & PD2plotM1<2) = 1;
PD2plotM1(-1< PD2plotM1 & PD2plotM1 < 1) = 0;
PD2plotM1((-2) < PD2plotM1 & PD2plotM1 <= (-1)) = (-1);
PD2plotM1(PD2plotM1 <= (-2)) = (-2);

%assignin('base','PD2plotM1',PD2plotM1)

taxis = [-2 2.48];
faxis = [0 200];

% val1 = min(min(min(PD2plot(1:100,:,:))));
% val2 = max(max(max(PD2plot(1:100,:,:))));
% val1 = (min(min(PD2plotM1(:,:,:)))); 
% val2 = (max(max(PD2plotM1(:,:,:))));
% clims1 = [val1 val2];
%clims1 = [-2 2];
    imagesc(taxis,faxis,PD2plotM1); 
    %colormap; %makes plot black and white (greyscale)
    
    %c1 = [0 0 1; 0.5 0.5 0.5; 0.5 0.5 0.5; 1 0 0];
%     if isempty(get(0,'Children'))
%         c1 = [0 0 1; 0.5 0.5 0.5; 1 0 0];
%         set(gcf,'Colormap',c1);
%     else
%     end
    
    
    
    
  
    % set the y-axis direction (YDir) to have zero at the bottom
    set(gca,'YDir','normal');
    % define tick marks along y-axis
    set(gca,'YTick',(0:50:200));
    axis square


    hold;
    %plot vertical bar at movement onset
    plot([0 0],ylim,'k:'); 

    % axis labels/title  
    xlabel('time (sec)');
    ylabel('frequency (Hz)');
   
    % list n for each group/brain area plot
%     annotation(hf1,'textbox','String',{'n=' numPD},'FontName',...
%         'Arial','FontSize',9,'FitBoxToText','off','LineStyle','none',...
%         'Position',[0.299 0.927 0.041 0.023]);
        
    %annotation(hf1,'textbox','String',{'Group PSD Z-scores'},'FontSize',12,...
%     'FontName','Arial',...
%     'FitHeightToText','off',...
%     'LineStyle','none',...
%     'Position',[0.005266 0.9639 0.1672 0.02706]);

   
    %annotation(hf1,'textbox','String',{'M1'},'FontSize',16,...
%     'FontName','Arial',...
%     'FitHeightToText','off',...
%     'LineStyle','none',...
%     'Position',[0.01874 0.8002 0.04415 0.03847]);

    %annotation(hf1,'textbox','String',{'PD'},'FontWeight','bold',...
%     'FontSize',18,...
%     'FontName','Arial',...
%     'FitHeightToText','off',...
%     'LineStyle','none',...
%     'Position',[0.211 0.948 0.058 0.043]);
%     end
    % put a color scale indicator next to the time-coherence plot
    %colorbar([0.9307 0.1048 0.02354 0.8226]);