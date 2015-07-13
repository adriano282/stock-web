package stock.controller.web.command.impl;

import domain.DomainEntity;
import stock.core.application.Result;

public class SaveCommand extends AbstractCommand {

	@Override
	public Result execute(DomainEntity entity) {
		return facade.save(entity);
	}

}
