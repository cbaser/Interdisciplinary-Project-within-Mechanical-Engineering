function  app  = fcn_set_attribute_dropdowns( app )
load('ws_global_attributes.mat','glo_names_possibilities');
            for i=1:size(glo_names_possibilities,1)
            a = cell(1,size(glo_names_possibilities{i,1},2)+1);
            a(:,2:end) = glo_names_possibilities{i,1};
            a{1,1} = 'null';
            glo_names_possibilities{i,1} = a;
            end
            app.VarianteDropDown.Items = glo_names_possibilities{1,1};
            app.LenkungsanordnungDropDown.Items = glo_names_possibilities{2,1};
            app.AntriebssystemDropDown.Items = glo_names_possibilities{3,1};
            app.AbtriebsartDropDown.Items = glo_names_possibilities{4,1};
            app.MotorEinbauartDropDown.Items = glo_names_possibilities{5,1};
            app.MotorBauformDropDown.Items = glo_names_possibilities{6,1};
            app.MotorSpezifikationDropDown.Items = glo_names_possibilities{7,1};
            app.MotorHubraumDropDown.Items = glo_names_possibilities{8,1};
            app.MotorleistungDropDown.Items = glo_names_possibilities{9,1};
            app.ZusatzleistungDropDown.Items = glo_names_possibilities{10,1};
            app.MotordrehmomentDropDown.Items = glo_names_possibilities{11,1};
            app.ZusatzdrehmomentDropDown.Items = glo_names_possibilities{12,1};
            app.BatteriekapazitatDropDown.Items = glo_names_possibilities{13,1};
            app.BrennstoffzellentypDropDown.Items = glo_names_possibilities{14,1};
            app.AbgasnormDropDown.Items = glo_names_possibilities{15,1};
            app.AbgasfuhrungDropDown.Items = glo_names_possibilities{16,1};
            app.AbgasPartikelfilterDropDown.Items = glo_names_possibilities{17,1};
            app.GetriebetypDropDown.Items =glo_names_possibilities{18,1};
            app.GetriebedrehmomentDropDown.Items = glo_names_possibilities{19,1};
            app.GetriebegangeDropDown.Items = glo_names_possibilities{20,1};
            app.LenkungstypDropDown.Items = glo_names_possibilities{21,1};
            app.LandDropDown.Items = glo_names_possibilities{22,1};
            app.KlimazoneDropDown.Items = glo_names_possibilities{23,1};
            app.KuhlerpaketDropDown.Items = glo_names_possibilities{24,1};
            app.HauptwasserkuhlerDickeDropDown.Items = glo_names_possibilities{25,1};
            app.ZusatzwasserkuhlerDropDown.Items = glo_names_possibilities{26,1};
            app.LufterartDropDown.Items = glo_names_possibilities{27,1};
            app.LufterleistungDropDown.Items = glo_names_possibilities{28,1};
            app.KaltemittelDropDown.Items = glo_names_possibilities{29,1};
            app.AnhangervorrichtungDropDown.Items = glo_names_possibilities{30,1};
            app.MaxRaderprogrammDropDown.Items = glo_names_possibilities{31,1};
            app.MaxVorderachstraglastDropDown.Items = glo_names_possibilities{32,1};
            app.FederungDropDown.Items = glo_names_possibilities{33,1};
            app.FahrwerkstypDropDown.Items = glo_names_possibilities{34,1};
            app.BremssystemDropDown.Items = glo_names_possibilities{35,1};
            app.UntereLastebeneDropDown.Items = glo_names_possibilities{36,1};
            app.FussgangerschutzDropDown.Items = glo_names_possibilities{37,1};
            app.KennzeichentragerDropDown.Items = glo_names_possibilities{38,1};
            app.FrontklappenmechanismusDropDown.Items = glo_names_possibilities{39,1};
            app.HauptscheinwerferDropDown.Items = glo_names_possibilities{40,1};
            app.MaterialDropDown.Items = glo_names_possibilities{41,1};
            app.KraftniveauDropDown.Items= glo_names_possibilities{42,1};
            app.BeladungszustandDropDown.Items = glo_names_possibilities{43,1};
            app.ZeitpunktDropDown.Items = glo_names_possibilities{44,1};

load('ws_attribute_type.mat');
value_name = strcat('ws_',attribute_type);
attribute_name = strcat(value_name,'_attributes.mat');
value_name = strcat(value_name,'_values.mat');

if(exist(attribute_name,'file')==2)
    load(attribute_name);
  app.VarianteDropDown.Value = attributes_matrix{1,1};
            app.LenkungsanordnungDropDown.Value = attributes_matrix{2,1};
            app.AntriebssystemDropDown.Value = attributes_matrix{3,1};
            app.AbtriebsartDropDown.Value = attributes_matrix{4,1};
            app.MotorEinbauartDropDown.Value = attributes_matrix{5,1};
            app.MotorBauformDropDown.Value = attributes_matrix{6,1};
            app.MotorSpezifikationDropDown.Value = attributes_matrix{7,1};
            app.MotorHubraumDropDown.Value = attributes_matrix{8,1};
            app.MotorleistungDropDown.Value = attributes_matrix{9,1};
            app.ZusatzleistungDropDown.Value = attributes_matrix{10,1};
            app.MotordrehmomentDropDown.Value = attributes_matrix{11,1};
            app.ZusatzdrehmomentDropDown.Value = attributes_matrix{12,1};
            app.BatteriekapazitatDropDown.Value = attributes_matrix{13,1};
            app.BrennstoffzellentypDropDown.Value = attributes_matrix{14,1};
            app.AbgasnormDropDown.Value = attributes_matrix{15,1};
            app.AbgasfuhrungDropDown.Value = attributes_matrix{16,1};
            app.AbgasPartikelfilterDropDown.Value = attributes_matrix{17,1};
            app.GetriebetypDropDown.Value =attributes_matrix{18,1};
            app.GetriebedrehmomentDropDown.Value = attributes_matrix{19,1};
            app.GetriebegangeDropDown.Value = attributes_matrix{20,1};
            app.LenkungstypDropDown.Value = attributes_matrix{21,1};
            app.LandDropDown.Value = attributes_matrix{22,1};
            app.KlimazoneDropDown.Value = attributes_matrix{23,1};
            app.KuhlerpaketDropDown.Value = attributes_matrix{24,1};
            app.HauptwasserkuhlerDickeDropDown.Value = attributes_matrix{25,1};
            app.ZusatzwasserkuhlerDropDown.Value = attributes_matrix{26,1};
            app.LufterartDropDown.Value = attributes_matrix{27,1};
            app.LufterleistungDropDown.Value = attributes_matrix{28,1};
            app.KaltemittelDropDown.Value = attributes_matrix{29,1};
            app.AnhangervorrichtungDropDown.Value = attributes_matrix{30,1};
            app.MaxRaderprogrammDropDown.Value = attributes_matrix{31,1};
            app.MaxVorderachstraglastDropDown.Value = attributes_matrix{32,1};
            app.FederungDropDown.Value = attributes_matrix{33,1};
            app.FahrwerkstypDropDown.Value = attributes_matrix{34,1};
            app.BremssystemDropDown.Value = attributes_matrix{35,1};
            app.UntereLastebeneDropDown.Value = attributes_matrix{36,1};
            app.FussgangerschutzDropDown.Value = attributes_matrix{37,1};
            app.KennzeichentragerDropDown.Value = attributes_matrix{38,1};
            app.FrontklappenmechanismusDropDown.Value = attributes_matrix{39,1};
            app.HauptscheinwerferDropDown.Value = attributes_matrix{40,1};
            app.MaterialDropDown.Value = attributes_matrix{41,1};
            app.KraftniveauDropDown.Value= attributes_matrix{42,1};
            app.BeladungszustandDropDown.Value = attributes_matrix{43,1};
            app.ZeitpunktDropDown.Value = attributes_matrix{44,1};
end

    end





% switch attribute_type
%     case 'Licence'
%     if(exist('ws_licence_attributes.mat','file')==2)
%         load('ws_licence_attributes.mat'); 
%          
%            
%     end
%    
%     
%     case 'Wheel'
%         if(exist('ws_wheel_attributes.mat','file')==2)
%             load('ws_wheel_attributes.mat');
%            
%             app.VarianteDropDown.Value = attributes_matrix{1,1};
%             app.LenkungsanordnungDropDown.Value = attributes_matrix{2,1};
%             app.AntriebssystemDropDown.Value = attributes_matrix{3,1};
%             app.AbtriebsartDropDown.Value = attributes_matrix{4,1};
%             app.MotorEinbauartDropDown.Value = attributes_matrix{5,1};
%             app.MotorBauformDropDown.Value = attributes_matrix{6,1};
%             app.MotorSpezifikationDropDown.Value = attributes_matrix{7,1};
%             app.MotorHubraumDropDown.Value = attributes_matrix{8,1};
%             app.MotorleistungDropDown.Value = attributes_matrix{9,1};
%             app.MotordrehmomentDropDown.Value = attributes_matrix{10,1};
%             app.BatteriekapazitatDropDown.Value = attributes_matrix{11,1};
%             app.BrennstoffzellentypDropDown.Value = attributes_matrix{12,1};
%             app.AbgasnormDropDown.Value = attributes_matrix{13,1};
%             app.AbgasfuhrungDropDown.Value = attributes_matrix{14,1};
%             app.AbgasPartikelfilterDropDown.Value = attributes_matrix{15,1};
%             app.GetriebetypDropDown.Value =attributes_matrix{16,1};
%             app.GetriebedrehmomentDropDown.Value = attributes_matrix{17,1};
%             app.GetriebegangeDropDown.Value = attributes_matrix{18,1};
%             app.LenkungstypDropDown.Value = attributes_matrix{19,1};
%             app.LandDropDown.Value = attributes_matrix{20,1};
%             app.KlimazoneDropDown.Value = attributes_matrix{21,1};
%             app.KuhlerpaketDropDown.Value = attributes_matrix{22,1};
%             app.HauptwasserkuhlerDickeDropDown.Value = attributes_matrix{23,1};
%             app.ZusatzwasserkuhlerDropDown.Value = attributes_matrix{24,1};
%             app.LufterartDropDown.Value = attributes_matrix{25,1};
%             app.LufterleistungDropDown.Value = attributes_matrix{26,1};
%             app.KaltemittelDropDown.Value = attributes_matrix{27,1};
%             app.AnhangervorrichtungDropDown.Value = attributes_matrix{28,1};
%             app.MaxRaderprogrammDropDown.Value = attributes_matrix{29,1};
%             app.MaxVorderachstraglastDropDown.Value = attributes_matrix{30,1};
%             app.FederungDropDown.Value = attributes_matrix{31,1};
%             app.FahrwerkstypDropDown.Value = attributes_matrix{32,1};
%             app.BremssystemDropDown.Value = attributes_matrix{33,1};
%             app.UntereLastebeneDropDown.Value = attributes_matrix{34,1};
%             app.FussgangerschutzDropDown.Value = attributes_matrix{35,1};
%             app.KennzeichentragerDropDown.Value = attributes_matrix{36,1};
%             app.FrontklappenmechanismusDropDown.Value = attributes_matrix{37,1};
%             app.HauptscheinwerferDropDown.Value = attributes_matrix{38,1};
%             app.MaterialDropDown.Value = attributes_matrix{39,1};
%             app.KraftniveauDropDown.Value= attributes_matrix{40,1};
%             app.BeladungszustandDropDown.Value = attributes_matrix{41,1};
%             app.ZeitpunktDropDown.Value = attributes_matrix{42,1};
%        
%         end
%        
%     
%     
%     
%     case 'Pedal'
%         if(exist('ws_pedal_attributes.mat','file')==2)
%             load('ws_pedal_attributes.mat');
%           
%              app.VarianteDropDown.Value = attributes_matrix{1,1};
%             app.LenkungsanordnungDropDown.Value = attributes_matrix{2,1};
%             app.AntriebssystemDropDown.Value = attributes_matrix{3,1};
%             app.AbtriebsartDropDown.Value = attributes_matrix{4,1};
%             app.MotorEinbauartDropDown.Value = attributes_matrix{5,1};
%             app.MotorBauformDropDown.Value = attributes_matrix{6,1};
%             app.MotorSpezifikationDropDown.Value = attributes_matrix{7,1};
%             app.MotorHubraumDropDown.Value = attributes_matrix{8,1};
%             app.MotorleistungDropDown.Value = attributes_matrix{9,1};
%             app.ZusatzleistungDropDown.Value = attributes_matrix{10,1};
%             app.MotordrehmomentDropDown.Value = attributes_matrix{11,1};
%             app.ZusatzdrehmomentDropDown.Value = attributes_matrix{12,1};
%             app.BatteriekapazitatDropDown.Value = attributes_matrix{13,1};
%             app.BrennstoffzellentypDropDown.Value = attributes_matrix{14,1};
%             app.AbgasnormDropDown.Value = attributes_matrix{15,1};
%             app.AbgasfuhrungDropDown.Value = attributes_matrix{16,1};
%             app.AbgasPartikelfilterDropDown.Value = attributes_matrix{17,1};
%             app.GetriebetypDropDown.Value =attributes_matrix{18,1};
%             app.GetriebedrehmomentDropDown.Value = attributes_matrix{19,1};
%             app.GetriebegangeDropDown.Value = attributes_matrix{20,1};
%             app.LenkungstypDropDown.Value = attributes_matrix{21,1};
%             app.LandDropDown.Value = attributes_matrix{22,1};
%             app.KlimazoneDropDown.Value = attributes_matrix{23,1};
%             app.KuhlerpaketDropDown.Value = attributes_matrix{24,1};
%             app.HauptwasserkuhlerDickeDropDown.Value = attributes_matrix{25,1};
%             app.ZusatzwasserkuhlerDropDown.Value = attributes_matrix{26,1};
%             app.LufterartDropDown.Value = attributes_matrix{27,1};
%             app.LufterleistungDropDown.Value = attributes_matrix{28,1};
%             app.KaltemittelDropDown.Value = attributes_matrix{29,1};
%             app.AnhangervorrichtungDropDown.Value = attributes_matrix{30,1};
%             app.MaxRaderprogrammDropDown.Value = attributes_matrix{31,1};
%             app.MaxVorderachstraglastDropDown.Value = attributes_matrix{32,1};
%             app.FederungDropDown.Value = attributes_matrix{33,1};
%             app.FahrwerkstypDropDown.Value = attributes_matrix{34,1};
%             app.BremssystemDropDown.Value = attributes_matrix{35,1};
%             app.UntereLastebeneDropDown.Value = attributes_matrix{36,1};
%             app.FussgangerschutzDropDown.Value = attributes_matrix{37,1};
%             app.KennzeichentragerDropDown.Value = attributes_matrix{38,1};
%             app.FrontklappenmechanismusDropDown.Value = attributes_matrix{39,1};
%             app.HauptscheinwerferDropDown.Value = attributes_matrix{40,1};
%             app.MaterialDropDown.Value = attributes_matrix{41,1};
%             app.KraftniveauDropDown.Value= attributes_matrix{42,1};
%             app.BeladungszustandDropDown.Value = attributes_matrix{43,1};
%             app.ZeitpunktDropDown.Value = attributes_matrix{44,1};
% 
%         end
%         
%       
%     case 'Downforce'
%         if(exist('ws_down_attributes_mat','file')==2)
%             load('ws_down_attributes.mat');
%              
%             app.VarianteDropDown.Value = attributes_matrix{1,1};
%             app.LenkungsanordnungDropDown.Value = attributes_matrix{2,1};
%             app.AntriebssystemDropDown.Value = attributes_matrix{3,1};
%             app.AbtriebsartDropDown.Value = attributes_matrix{4,1};
%             app.MotorEinbauartDropDown.Value = attributes_matrix{5,1};
%             app.MotorBauformDropDown.Value = attributes_matrix{6,1};
%             app.MotorSpezifikationDropDown.Value = attributes_matrix{7,1};
%             app.MotorHubraumDropDown.Value = attributes_matrix{8,1};
%             app.MotorleistungDropDown.Value = attributes_matrix{9,1};
%             app.ZusatzleistungDropDown.Value = attributes_matrix{10,1};
%             app.MotordrehmomentDropDown.Value = attributes_matrix{11,1};
%             app.ZusatzdrehmomentDropDown.Value = attributes_matrix{12,1};
%             app.BatteriekapazitatDropDown.Value = attributes_matrix{13,1};
%             app.BrennstoffzellentypDropDown.Value = attributes_matrix{14,1};
%             app.AbgasnormDropDown.Value = attributes_matrix{15,1};
%             app.AbgasfuhrungDropDown.Value = attributes_matrix{16,1};
%             app.AbgasPartikelfilterDropDown.Value = attributes_matrix{17,1};
%             app.GetriebetypDropDown.Value =attributes_matrix{18,1};
%             app.GetriebedrehmomentDropDown.Value = attributes_matrix{19,1};
%             app.GetriebegangeDropDown.Value = attributes_matrix{20,1};
%             app.LenkungstypDropDown.Value = attributes_matrix{21,1};
%             app.LandDropDown.Value = attributes_matrix{22,1};
%             app.KlimazoneDropDown.Value = attributes_matrix{23,1};
%             app.KuhlerpaketDropDown.Value = attributes_matrix{24,1};
%             app.HauptwasserkuhlerDickeDropDown.Value = attributes_matrix{25,1};
%             app.ZusatzwasserkuhlerDropDown.Value = attributes_matrix{26,1};
%             app.LufterartDropDown.Value = attributes_matrix{27,1};
%             app.LufterleistungDropDown.Value = attributes_matrix{28,1};
%             app.KaltemittelDropDown.Value = attributes_matrix{29,1};
%             app.AnhangervorrichtungDropDown.Value = attributes_matrix{30,1};
%             app.MaxRaderprogrammDropDown.Value = attributes_matrix{31,1};
%             app.MaxVorderachstraglastDropDown.Value = attributes_matrix{32,1};
%             app.FederungDropDown.Value = attributes_matrix{33,1};
%             app.FahrwerkstypDropDown.Value = attributes_matrix{34,1};
%             app.BremssystemDropDown.Value = attributes_matrix{35,1};
%             app.UntereLastebeneDropDown.Value = attributes_matrix{36,1};
%             app.FussgangerschutzDropDown.Value = attributes_matrix{37,1};
%             app.KennzeichentragerDropDown.Value = attributes_matrix{38,1};
%             app.FrontklappenmechanismusDropDown.Value = attributes_matrix{39,1};
%             app.HauptscheinwerferDropDown.Value = attributes_matrix{40,1};
%             app.MaterialDropDown.Value = attributes_matrix{41,1};
%             app.KraftniveauDropDown.Value= attributes_matrix{42,1};
%             app.BeladungszustandDropDown.Value = attributes_matrix{43,1};
%             app.ZeitpunktDropDown.Value = attributes_matrix{44,1};
%        
%         end
% 
% end
%  
%        




