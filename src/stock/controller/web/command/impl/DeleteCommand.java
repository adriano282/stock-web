package stock.controller.web.command.impl;

import stock.core.application.Result;
import domain.DomainEntity;

public class DeleteCommand extends AbstractCommand {

	@Override
	public Result execute(DomainEntity entity) {
		return facade.delete(entity);
	}
	
}
