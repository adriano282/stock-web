package stock.controller.web.command.impl;

import domain.DomainEntity;
import stock.controller.web.command.ICommand;
import stock.core.IFacade;
import stock.core.application.Result;
import stock.core.impl.controller.Facade;

public abstract class AbstractCommand implements ICommand {

	protected IFacade facade = new Facade();
	
	public Result execute(DomainEntity entity, Integer page, Integer recordsPerPage) {
		return null;
	}
	
	

}
