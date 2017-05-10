class smm{
    class spawner{
        file = "smm_spawner\functions";
        #include "smm_spawner\functions\spawner_functions.hpp"
    };
    class gear{
        file = "smm_gear\functions";
        #include "smm_gear\functions\gear_functions.hpp"
    };
	class thermal_blocker{
		file = "smm_thermal_blocker\functions";
		#include "smm_thermal_blocker\functions\thermal_blocker_functions.hpp"
	};
	
	class shop{
		file = "smm_shop\functions";
		#include "smm_shop\functions\shop_functions.hpp"
	};
	
	class tickets{
		file = "smm_tickets\functions";
		#include "smm_tickets\functions\ticket_functions.hpp"
	};
	
	class medic{
		file = "smm_medic\functions";
		#include "smm_medic\functions\medic_functions.hpp"
	};
	class helpers{
		file = "smm_helpers\functions";
		#include "smm_helpers\functions\helper_functions.hpp"
	}
};