
function statAnalysis_violin(type1_para1, type2_para1, test)

chartColors1.c1 = rgb('DodgerBlue');
chartColors1.c2 = rgb('Navy'); 
paraSize = 1;
fSize = 40;
lSize = 4;

if test == 1
    [~, p_value1_1] = ttest2(type1_para1(:,1), type2_para1(:,1), 'Alpha', 0.01);
    [~, p_value2_1] = ttest2(type1_para1(:,2),type2_para1(:,2), 'Alpha', 0.01);
elseif  test == 2
    [p_value1_1,~] = ranksum(type1_para1(:,1), type2_para1(:,1), 'Alpha', 0.01);
    [p_value2_1,~] = ranksum(type1_para1(:,2),type2_para1(:,2),'Alpha', 0.01);
end

para1_p = [p_value1_1 p_value2_1];

f1 = figure;
% get(f1,'Position')
% move right | move up | expand right | expand up
set(gcf, 'Position',  [100, -200, 1050, 850])
figName = {'petal length' 'petal width'};
for b = 1:size(type1_para1,2)
    
    currPara_type1 = type1_para1(:,b);
    currPara_type2 = type2_para1(:,b);
    
    [vioplot_t1, regVec_t1] = violinData1(currPara_type1, paraSize);
    [vioplot_t2, regVec_t2] = violinData2(currPara_type2, paraSize);
    
    conVio_t1t2 = [vioplot_t1;vioplot_t2];
    conVec_t1t2 = [regVec_t1;regVec_t2];
    
    subplot(1,size(type1_para1,2),b);
    violinPlot(conVio_t1t2, conVec_t1t2, chartColors1, ...
        'ViolinAlpha', 1, 'EdgeColor', [1 1 1], 'ShowMean', true);
    % darkBackground(f1,[0 0 0],[1 1 1])
    
    padVal = 0.4*(max(conVio_t1t2)-min(conVio_t1t2));
    ylimH = ceil(max(conVio_t1t2)+padVal);
    ylimL = floor(min(conVio_t1t2)-padVal);
    
    ylim([ylimL ylimH])
    xlim([0.5 2.5])
    xlabel(figName{b},'fontweight','bold')
    if b == 1
        ylabel('distance (cm)','fontweight','bold','FontSize',fSize)
    end
    % title({'Iris flowers','petal comparision'})
    % set(gca,'YTick',(100:200:500))
    % set(gca,'XTick',[])
    set(gca, 'XTick', [1 2])
    a1 = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a1,'fontsize',fSize)
    set(gca, 'XTickLabel', {'Setosa' 'Virginica'})
    xtickangle(45)
    set(gca,'linewidth',lSize)
    % grid on
    % set(gca, 'YGrid', 'on', 'XGrid', 'off')

    % *uncomment to add zero horizontal line*
    hold on
    xL = get(gca, 'XLim');
    plot(xL,[0 0] , 'color',rgb('Black'), ...
        'LineWidth',lSize,'LineStyle',':');
    
    if para1_p(b) <= 0.05
        hold on
        yL = get(gca, 'YLim');
        plot([1,2], [yL(2)-(yL(2) ...
            -yL(1))*0.125 yL(2)-(yL(2)-yL(1))*0.125], ...
            'color',rgb('Black'),'LineWidth',lSize);
        if para1_p(b) <= 0.00001
            stars0 = '*****';
        elseif para1_p(b) <= 0.0001
            stars0 = '****';
        elseif para1_p(b) <= 0.001
            stars0 = '***';
        elseif para1_p(b) <= 0.01
            stars0 = '**';
        else
            stars0 = '*';
        end
        hold on
        text(1.5,yL(2)-(yL(2)-yL(1))*0.09375, stars0, 'Color', 'k', ...
            'FontSize', fSize, 'FontWeight', 'bold', ...
            'HorizontalAlignment', 'center')
    end
    
end

end

