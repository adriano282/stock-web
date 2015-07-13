package stock.controller.web.command.impl;

import stock.core.application.Result;
import domain.DomainEntity;

public class UpdateCommand extends AbstractCommand{
	
	@Override
	public Result execute(DomainEntity entity) {
		return facade.update(entity);
	}

}
